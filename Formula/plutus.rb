class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.47.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "cd6878d5543d0b0ad8597a4b444037b2b0bdf5e4bc0cc9887f26c6fcc0cf629c"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "375825b7400c91ff9b2c29a3b129ca643f6ae35e6900a84a87127ce496ca79d5"
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
