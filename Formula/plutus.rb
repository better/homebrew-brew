class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.11.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "4bf867e5c5f66bf871645836d506a2a5d8dfa72a6e7ff96fb0a834d0f67b9850"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "c294896b19574cfe8b6458bab8d7318d01b6ede6c2c4fbe3a21d034363fe32c5"
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
