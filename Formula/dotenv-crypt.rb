class DotenvCrypt < Formula
  desc "Encrypt individual values in .env files using AES-256-GCM with macOS Keychain"
  homepage "https://github.com/gritse/dotenv-crypt"
  url "https://github.com/gritse/dotenv-crypt/archive/refs/tags/v0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
