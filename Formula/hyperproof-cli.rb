class HyperproofCli < Formula
  desc "Hyperproof Command-line Interface"
  homepage "https://hyperproof.io"
  url "https://downloads.hyperproof.app/hpcli/hpcli-binaries-1.2.2.tar.gz"
  sha256 "efefdfd6a08cc3b65b4fe2cbc9a5bf342e2a02a5613d2b3378d2fd0e128baafe"
  license "MIT"

  def install
    bin.install "mac/arm64/hp" if OS.mac? && Hardware::CPU.arm?
    bin.install "mac/x64/hp" if OS.mac? && Hardware::CPU.intel?
    bin.install "linux/x64/hp" if OS.linux?
  end

  test do
    version = shell_output("#{bin}/hp --version")
    assert_match(/1.2.2.[\d+]/, version)
  end
end
