class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.59.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "92d4159bb681ebca76ea75e992b8c5b64bc325a7f1dd07f4c036603ef03760a7"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "eae32bdf3e4cea864fa0480c456d21aa20f4935b21b1a46eb0a37d537c0a0bca"
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
