class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.6.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "ab29c4b0f6d5967722310cc7bc589a296a0564fb27c8c3408ee762ba6c338461"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "044f13007d254bde90ac90ec2b10189c77bd43a5ca9d9e906a46e420000cf049"
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
