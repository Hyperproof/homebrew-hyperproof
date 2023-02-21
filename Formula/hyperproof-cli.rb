class HyperproofCli < Formula
  desc "Hyperproof Command-line Interface"
  homepage "https://hyperproof.io"
  url "https://downloads.hyperproof.app/hpcli/hpcli-binaries-0.9.1.tar.gz"
  sha256 "e2102a116d777c4e43865c4292a6158dfa4f8a1285c630ba2b04ebad64874fcb"
  license "MIT"

  def install
    bin.install "mac/arm64/hp" if OS.mac? && Hardware::CPU.arm?
    bin.install "mac/x64/hp" if OS.mac? && Hardware::CPU.intel?
    bin.install "linux/x64/hp" if OS.linux?
  end

  test do
    version = shell_output("#{bin}/hp --version")
    assert_match(/0.9.1.[\d+]/, version)
  end
end
