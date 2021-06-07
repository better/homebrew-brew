class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.49.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "9f1993969c416ab485e97bfd0cb9ca5e801f016709a08cba6a6f22457e62b876"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "11a43d6228adf45d42dd51916553a1b3ab07e7a2a343c04432d1d056a3d8ee33"
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
