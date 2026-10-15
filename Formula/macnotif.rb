# typed: strict
# frozen_string_literal: true

# Homebrew formula for the native macOS MacNotif executable.
class Macnotif < Formula
  desc "Lightweight macOS HUD for temporary and permanent notices"
  homepage "https://github.com/Thames1990/macnotif"
  version "1.0.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/Thames1990/homebrew-tap/releases/download/v#{version}/macnotif-#{version}-arm64.tar.gz"
      sha256 "4a4eaa0fb33f428bdf56b766b7615a18426ffc4225a70ee406442ffea744f15d"
    end

    on_intel do
      url "https://github.com/Thames1990/homebrew-tap/releases/download/v#{version}/macnotif-#{version}-x86_64.tar.gz"
      sha256 "d52908cd9328a9940f4a78fcdc1f52b2e975e30fc4e380c7227971d46e36031b"
    end
  end

  def install
    bin.install "macnotif"
  end

  test do
    ENV["HOME"] = testpath
    ENV["CFFIXED_USER_HOME"] = testpath
    system bin/"macnotif", "--clear"
    assert_predicate testpath/"Library/Application Support/MacNotif", :directory?
  end
end
