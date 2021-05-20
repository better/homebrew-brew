class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.48.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "2186dab02a64facfe91ad5d9c7dd5f29a2b9bb22f44b578a926ae86ce69868cb"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "81b1aca2def379ee0e66a540ee5218081d04bcc0cc3d2ff9f4bbadcc697c539a"
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
