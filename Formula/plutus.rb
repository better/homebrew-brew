class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.50.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "3018ebb0912b21ef9c130758f840b335a1d2ab5c3a08e613a4259f1f9c8c2a37"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "f22be28326b1ff1ded2f7037479fb9d61566c2491e7e5ad2df570353b9d3a360"
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
