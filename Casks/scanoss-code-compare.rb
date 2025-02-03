cask "scanoss-code-compare" do
    version "0.6.0" # Updated by GitHub Actions
    sha256 "215ca752d3b80402e880c19887f48e36c9deaf6224a41ac52256dcbd9d230f6a" # Updated by GitHub Actions
  
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

        # Pass all arguments to the application using macOS's open --args
        open -a "SCANOSS Code Compare" --args "$@"
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
