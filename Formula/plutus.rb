class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "3d4cceb2092b4ef60c439e3fe3663e3bbf2571ab07a1604ac61aa81ee8d261fa"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "8c89616e656347143aa0b28b37eb46dee5ebaa49178e4aacb2c9965bfbe2a75a"
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
