class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.47.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "63bc52a11198a93fc91c97fc70a19d9cdf8f1bdff8191b175d7a0763c1952dbc"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "eb0b3b9cdfec6e85b5a27cdb38f11eb472599d3fbfe0a98e40fb09b95f9452ae"
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
