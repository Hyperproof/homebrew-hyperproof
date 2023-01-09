class HyperproofCli < Formula
  desc "Hyperproof CLI"
  homepage "https://hyperproof.io"
  url "https://downloads.hyperproof.app/hpcli/hpcli-binaries-0.8.7.tar.gz"
  sha256 "9e7b6ce9078d7e6d106a36421686996e4c6af66b02748fe0f7373aa92e1ab553"
  license "MIT"

  def install
    bin.install "mac/arm64/hp" if OS.mac? && Hardware::CPU.arm?
    bin.install "mac/x64/hp" if OS.mac? && Hardware::CPU.intel?
    bin.install "linux/x64/hp" if OS.linux?
  end

  test do
    version = shell_output("#{bin}/hp --version")
    assert_match /0.8.7.[\d+]/, version
  end
end
