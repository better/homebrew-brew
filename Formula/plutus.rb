class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.24.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "122c2ca7f1df46361e78503991f005083e37dcb1fdfd56dd9f174f51fac340fb"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "da099e12a14342587580d6aa29694222c7f4e9c0d10fbee2ea7d6dfd24727f2c"
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
