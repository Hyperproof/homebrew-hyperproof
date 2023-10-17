class HyperproofCli < Formula
  desc "Hyperproof Command-line Interface"
  homepage "https://hyperproof.io"
  url "https://downloads.hyperproof.app/hpcli/hpcli-binaries-1.0.0.tar.gz"
  sha256 "86d7c4e83e5f86384a82ca52ad5594cd6b7a35247ca1d78f862ed5551ddfd6cb"
  license "MIT"

  def install
    bin.install "mac/arm64/hp" if OS.mac? && Hardware::CPU.arm?
    bin.install "mac/x64/hp" if OS.mac? && Hardware::CPU.intel?
    bin.install "linux/x64/hp" if OS.linux?
  end

  test do
    version = shell_output("#{bin}/hp --version")
    assert_match(/1.0.0.[\d+]/, version)
  end
end
