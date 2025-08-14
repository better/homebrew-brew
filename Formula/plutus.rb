class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "2.6.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "94f1a264bf124c03abd9fd2ac1316b877fe29c2d63bbfbb4c456a06a05f9fa21"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "172cf50a3bb51243ae84ef31af1e59ab7d4cb26692915d43e9b210b8107687b3"
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
