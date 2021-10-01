class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.12.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "5caa4ad4aef6eac47926494a72a15605c9ba69513bd4dde38ec3ef4aabaf9161"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "198ff5268fd0e8af88ad36334bed7ba9e2ca7d8682d032992f1ec827d142a313"
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
