class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.47.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "e1463a9c9d4a6b7a0886cb8751593962d66c25a0910fdc0fc6a930ec83c71ca6"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "ee76289f522a8b87c6b53bad8eae5e0bcba5483cc4cb81ebf5305a172dc534da"
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
