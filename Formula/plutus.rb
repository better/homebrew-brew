class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.11.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "37fe9ccd2ae6e58728f550e22ddf995ef59d5ca2d1128e53cdeddfebef67df7c"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "af99ab243d7d899bfb991857f3c75178d63a5b4d3519e3ccfaf56a655383f0a5"
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
