class ScannerC < Formula
  desc "SCANOSS scanner.c is a simple console-based OSS scanner using the free OSSKB"
  homepage "https://www.scanoss.com"
  url "https://github.com/scanoss/scanner.c/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "b4cf139968df1588fe7c76dbb255b4bf8fe476ee1d62a6447379db1f7a35cea2"
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
