# Start with the provided bit sequence
initial_bits = "0001_0000_0001_0000_0001_0000_0001_0000_0001_0000_0001_0000_0001_0000_0001_0000_0001_0000_0001_0000"

# Each group is 9 bits including underscores, so we count how many bits are in the initial sequence
# Remove underscores to count actual bits
bit_count = len(initial_bits.replace("_", ""))

# We need 1200 total bits, so calculate how many additional bits are required
total_bits_needed = 1200
remaining_bits_needed = total_bits_needed - bit_count

# The provided pattern repeats "0001_0000", so we repeat this until we fill 1200 bits
pattern = "0001_0000"
while len(initial_bits.replace("_", "")) < total_bits_needed:
    initial_bits += "_" + pattern

# Remove any excess bits and truncate to exactly 1200 bits
final_bits = initial_bits.replace("_", "")[:total_bits_needed]

# Reintroduce underscores every 4 bits for clarity
final_bits_formatted = "_".join([final_bits[i:i+4] for i in range(0, len(final_bits), 4)])

print(final_bits_formatted)
