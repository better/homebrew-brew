class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.46.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.3/bin/darwin-x64", :using => :nounzip
    sha256 "d35dbde2ff3560b7288bee52d72e630ca25e936d80287c6a6cf8cb2a820f02c9"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.3/bin/linux-x64", :using => :nounzip
    sha256 "2f0592c0dbabac00145413d528bf3308e84f8fc32352109f998b6e0ad2c2116f"
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
