class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.14.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "34c361269af3912e1e0db70200cf249f13293d06dd78243005f96ca59b8d9d29"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "dcd411ae6cd93928d9a9740ef1ac66c8bcdfceb04af45cc9ed7c9fb37a403b3a"
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
