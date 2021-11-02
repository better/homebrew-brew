class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.16.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "dfa57ce2a95efe9ba13f2eea4fb11644ffc0d9862a8bed0bd0dead433ab8a2a0"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "56a4505f759b90ca619da67ca86c9f3baf93b26dbed279b3ec4a94c502ef151c"
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
