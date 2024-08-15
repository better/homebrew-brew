class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.40.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "59028edd38fa34dbf84ab1a69ba9f81a856a5d5151b9795c8cea2d4daf5e3afd"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "b0ca9da036c79498c94bd3cef7db561a7fd40c0dd9f4b59466a318da526b451f"
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
