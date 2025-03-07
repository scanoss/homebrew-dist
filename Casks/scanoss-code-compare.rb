cask "scanoss-code-compare" do
    version "0.6.1" # Updated by GitHub Actions
    sha256 "51e31a34332bb5ccf64f82e2d4ec442855cca63b86e2ce33dc29bd97890771fc" # Updated by GitHub Actions
  
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
      
      File.write shimscript, <<~EOS
        #!/bin/bash

        CURRENT_DIR=$(pwd)

        # Handle version flag directly
        if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
          exec "#{binary}" "$@"
          exit 0
        fi

        # If no arguments are provided, assume scanning mode and add --scan-root.
        if [ "$#" -eq 0 ]; then
          exec "#{binary}" --scan-root "$CURRENT_DIR"
        fi

        # If the first argument starts with a dash, assume scanning options.
        first_arg="$1"
        if [[ "$first_arg" == "-"* ]]; then
          # Check if --scan-root is already provided.
          found=0
          for arg in "$@"; do
            if [ "$arg" = "--scan-root" ]; then
              found=1
              break
            fi
          done
          if [ $found -eq 0 ]; then
            exec "#{binary}" --scan-root "$CURRENT_DIR" "$@"
          else
            exec "#{binary}" "$@"
          fi
        else
          # Otherwise, assume subcommand mode and pass arguments as-is.
          exec "#{binary}" "$@"
        fi
      EOS
      
      FileUtils.chmod "+x", shimscript
      
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
