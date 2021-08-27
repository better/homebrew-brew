class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.3.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "405e4c8511239e1643c3c0282e201686fb4c727bdf7d9b703527e2aa3bc37f2c"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "65fdfa41f8e44e64313da2aeaed30bbdc0e77250b7bf7a3ac7930c3e06304bc9"
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
