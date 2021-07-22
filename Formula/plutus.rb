class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.57.5"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "097c4debb7c7f7401f2ad7f2e3e441a4f1a176c3dc81ecfb67b235d05d698798"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "04e0a75cef3d7260b9ebd14b8d026c8066e135d4d8796a25dc32c0d3283929b3"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
