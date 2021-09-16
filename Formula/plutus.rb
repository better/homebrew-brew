class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.5"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "30be2b461af796f0ac840550a949c5ba5ecf91c26d0aa56d5ff6d76f75c1661f"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "713d4069b92c1898e535d42af12bf6c1368924f37610c083330ed9d0b3e3346c"
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
