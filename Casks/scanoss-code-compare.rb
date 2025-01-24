cask "scanoss-code-compare" do
    version "" # Updated by GitHub Actions
    sha256 "c3976a5dcca59ba6c4df5fb13e508bca7859fa937b92d899a8589386c53634a9" # Updated by GitHub Actions
  
    url "https://github.com/scanoss/scanoss.cc/releases/download/v#{version}/SCANOSS.Code.Compare-mac.zip"
    name "SCANOSS Code Compare"
    desc "GUI and CLI tool for quickly visualizing undeclared open source findings"
    homepage "https://github.com/scanoss/scanoss.cc"

    depends_on macos: ">= :catalina"

    container nested: "SCANOSS Code Compare-v#{version}.dmg"
    app "SCANOSS Code Compare.app"
  
    # Wrapper script that handles both GUI and CLI modes
    postflight do
      binary = "#{appdir}/SCANOSS Code Compare.app/Contents/MacOS/SCANOSS Code Compare"
      shimscript = "#{staged_path}/scanoss-cc.wrapper.sh"
      
      # This wrapper script ensures proper context for both GUI and CLI operations
      File.write shimscript, <<~EOS
        #!/bin/bash
  
        # Get the full path to the binary
        BINARY="#{binary}"
        APP_DIR="#{appdir}/SCANOSS Code Compare.app/Contents/MacOS"
  
        # Change to the correct working directory
        cd "$APP_DIR"
  
        # Check if any arguments were provided
        if [ $# -eq 0 ]; then
          # No arguments - launch GUI
          open -a "SCANOSS Code Compare"
        else
          # Arguments provided - run in CLI mode
          exec "$BINARY" "$@"
        fi
      EOS
      
      # Make the wrapper script executable
      FileUtils.chmod "+x", shimscript
      
      # Create the symlink in a standard location
      FileUtils.ln_sf shimscript, "#{HOMEBREW_PREFIX}/bin/scanoss-cc"
    end
  
    uninstall_postflight do
      # Remove the CLI symlink on uninstall
      FileUtils.rm "#{HOMEBREW_PREFIX}/bin/scanoss-cc" if File.exist? "#{HOMEBREW_PREFIX}/bin/scanoss-cc"
    end
  
    zap trash: [
      "~/Library/Application Support/SCANOSS Code Compare",
      "~/Library/Preferences/com.scanoss.code-compare.plist",
      "~/Library/Saved Application State/com.scanoss.code-compare.savedState"
    ]
  end
