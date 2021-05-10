class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.46.5"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "97af4a09ae5b455f7434e71df5483e793fee7243d6f7ffdeb9308fa5f7556842"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "51725d98c4c2d106f17b9ad05d2bdcadc2cd934ae5283cad1db69a5cfa2aab7a"
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
