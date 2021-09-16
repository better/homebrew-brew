class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.9.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "b708ee6fd96ca322e7a1f425f6b2fef86132ed988894b09d118e110bea43eac1"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "0dfc0a3c5ee9ae2994fe8f03b77cec607c982a78d6f8b539bb71439fb4324bce"
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
