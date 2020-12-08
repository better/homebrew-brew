class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.27.0/plutus-v0.27.0-darwin-x64.tar.gz"
    sha256 "d1dee554ddc07f3848f75556a34afc54aba4db9bea31905faae01beafab111ec"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.27.0/plutus-v0.27.0-linux-x64.tar.gz"
    sha256 "1aa059839676b648d26a756d6d4689f93802ab79589dc345c1c002d0f5c49447"
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
