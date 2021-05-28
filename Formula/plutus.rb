class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.48.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "bb5780a44f6e4bb776afc0985fd82ba9667b1f5671fd3f7761b5b10bec5ba645"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "307835af1c3e332e943f7bfb24a56e63654786649ca8138d0e16fba195ea0f91"
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
