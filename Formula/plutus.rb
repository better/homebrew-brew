class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.48.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "593a23fef72f57ecd105087f3ecc3262b030fae4912d4c9058c88616e6bca0b4"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "de89e2eff469e499d8f6fabf0e8ef0bccac8df94bfe5edd3cde7fadd0564ba5d"
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
