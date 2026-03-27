class DotenvCrypt < Formula
  desc "Encrypt individual values in .env files using AES-256-GCM with macOS Keychain"
  homepage "https://github.com/gritse/dotenv-crypt"
  url "https://github.com/gritse/dotenv-crypt/archive/refs/tags/v0.1.tar.gz"
  sha256 "d3364670f3ab5cebb7f76ebc16f6961d24744efc23000cfab8fc3aaed0410737"
  license "GPL-2.0-only"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/dotenv-crypt"
  end

  test do
    assert_match "USAGE: dotenv-crypt", shell_output("#{bin}/dotenv-crypt --help 2>&1")
  end
end
