class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.45.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "e4f3ac91a8ace4be1a0cb5c2aef3c60fef9de08b9403a1854e74b3ca39eb20d4"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "caf7483b0b0855b347910492f6b1c5e2fbdcbf7c4a2149028289a8cb748968a5"
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
