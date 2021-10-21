class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.15.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "11975b479a13a797c0eb3c0778d04a2a79d9e1aa0d14127dfa8dc87b5e59bd8e"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "29942293c8df9023ebcfda9fac420c11dd81bca500711b3acbde7a41b6dcecb1"
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
