class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.1/earnie_0.3.1_darwin_arm64.tar.gz"
      sha256 "f523d8d33570b0d51c83b8907030195c6c20843f4342f037b68e7fa72a34a080"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.1/earnie_0.3.1_darwin_amd64.tar.gz"
      sha256 "27ae50254d538df0c177362d19413d70ad8008c31d8779bae69b53028a0b21ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.1/earnie_0.3.1_linux_arm64.tar.gz"
      sha256 "8af5450da6bd8d76045eb0a87def4b16fd1353bceab1177f34b704b9e24aae13"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.1/earnie_0.3.1_linux_amd64.tar.gz"
      sha256 "9f9491231059905644ff6891c9eefa4b57d3416279de5b021ec0f5a5be96c763"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end
