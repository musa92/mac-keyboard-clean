class KeyboardClean < Formula
  desc "Safe keyboard cleaning mode for macOS (screen-off or lock + keep-awake)"
  homepage "https://github.com/musa92/keyboard-clean"
  url "https://github.com/musa92/keyboard-clean/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_ME_AFTER_RELEASE"
  license "MIT"

  def install
    bin.install "scripts/keyboard-clean"
  end

  test do
    # Dry check: ask for help text
    assert_match "keyboard-clean v", shell_output("#{bin}/keyboard-clean --help")
  end
end
