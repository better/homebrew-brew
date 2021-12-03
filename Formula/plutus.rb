class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.20.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "82a6ee04c4b2c1d142ac6a5d542eb425b9599600c9bd517b1e5cfd499d19eed4"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "ecadf7eeccd8d4d584253385e2b017d27a556e8d32cb1319b38014ec3fd16711"
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
