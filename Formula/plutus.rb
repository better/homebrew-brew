class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.5.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "8ef9e13a83be9389bfbedfe6406df911f0162322fc47f4dea46e91bb38dbe968"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "e2f01443b88ea84bdc0e56dc43b37e6aa8624608f65d4fbc624aaad73e54a6b2"
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
