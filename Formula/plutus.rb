class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.46.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.2/bin/darwin-x64", :using => :nounzip
    sha256 "08ee4e6aee2edbd125319e9e22ad717bec1c67c8d3b2f23f0a16da66bd2bed10"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.2/bin/linux-x64", :using => :nounzip
    sha256 "62a32c677542167559ff11b6df09ebd3cd28aed15ca50b0771a4b740f8b54d9e"
    $executable_name = "linux-x64"
  end

  def install
    mv $executable_name, name
    system "chmod", "+x", name
    libexec.install name
    bin.install_symlink libexec/name
  end

  test do
    system bin/name, "version"
  end
end
