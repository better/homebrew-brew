class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.33.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "417c84ab65f094ff394b98ef1b9a385e4fbd1ff77eed9e4eee3c68a4e9181796"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "39a02ddda155b494646fcc506cd9e0539afdca047c77643ba88ed0dd58c0c04e"
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
