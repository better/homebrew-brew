class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.28.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "99ccd9ee0c3a350a1e64dfd12e784cec38aaac748b0fecf1bdc6e7084094a000"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "a305bdd9e961624293b992a562705d7fcfa2151d8f5c23916e42b3c279ee6acd"
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
