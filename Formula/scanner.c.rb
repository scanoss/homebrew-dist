class ScannerC < Formula
  desc "SCANOSS scanner.c is a simple console-based OSS scanner using the free OSSKB"
  homepage "https://www.scanoss.com"
  url "https://github.com/scanoss/scanner.c/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "59cc37d1d9b3833a5ff3e1fc0d5f57e7231f84f23faf86b77c0d1c6b01d7a2da"
  license "GPL-2.0-or-later"

  depends_on "curl"
  depends_on "openssl@1.1"

  def install
    ENV.deparallelize
    system "make", "scanner"
    bin.install "scanner"
    print("Exec from #{bin} or add it to your PATH")
  end

  test do
    system "false"
  end
end
