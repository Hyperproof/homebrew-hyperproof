class HyperproofCli < Formula
  desc "Hyperproof Command-line Interface"
  homepage "https://hyperproof.io"
  url "https://downloads.hyperproof.app/hpcli/hpcli-binaries-0.8.9.tar.gz"
  sha256 "cfac36f3a81f7a575721c95234f4560d64422a99cbfc0715a0510425dceea224"
  license "MIT"

  def install
    bin.install "mac/arm64/hp" if OS.mac? && Hardware::CPU.arm?
    bin.install "mac/x64/hp" if OS.mac? && Hardware::CPU.intel?
    bin.install "linux/x64/hp" if OS.linux?
  end

  test do
    version = shell_output("#{bin}/hp --version")
    assert_match(/0.8.9.[\d+]/, version)
  end
end
