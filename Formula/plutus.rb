class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.53.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "acdffe6ce4773a057564103654c765ff4ff9a8dec6b26880ed3f1d68e8e450dd"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "01ab5724962aa52ba44d4e2b9fc6a29ce040346ab444239b91a37c18f27fafcc"
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
