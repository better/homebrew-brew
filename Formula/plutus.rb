class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.47.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "861477eab61b30026afc09c921cbaf9e0dc69b51f5a1aa2c40e91098df3bd5e6"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "036883b15a0d7cee8eb2a66cfeaa47357bc916bb20d433dbccc3711b04b57299"
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
