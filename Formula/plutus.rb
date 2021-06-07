class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.49.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "655e40556b430d0cb2de93f218e8ef85bbc931281beb20e1cdda54b263b53323"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "b8e95b5fbeaaec55e5ef176bc9e21c9fe81eeaffbb10dde89dc4f6463b23ad5c"
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
