class HyperproofCli < Formula
  desc "Hyperproof Command-line Interface"
  homepage "https://hyperproof.io"
  url "https://downloads.hyperproof.app/hpcli/hpcli-binaries-1.2.6.tar.gz"
  sha256 "df0e208c5728b4a2f7af4b24f26451b557cb1021162eb6bef3db036a98932d11"
  license "MIT"

  def install
    bin.install "mac/arm64/hp" if OS.mac? && Hardware::CPU.arm?
    bin.install "mac/x64/hp" if OS.mac? && Hardware::CPU.intel?
    bin.install "linux/x64/hp" if OS.linux?
  end

  test do
    version = shell_output("#{bin}/hp --version")
    assert_match(/1.2.6.[\d+]/, version)
  end
end
