class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.17.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "1190009f19666248b6431d274a9fba2b7cd2d1f8c31f18203e1a7b53298b2dcc"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "2d1e4f1f596d58f0caf2ba02baf7ad641da65be7b9aaef9e289d525d5269e7ba"
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
