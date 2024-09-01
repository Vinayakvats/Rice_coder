function compressed_output = rice_encoder(value, K, M)
    % Calculate quotient and remainder
    quotient = floor(value / M);
    remainder = bitand(value, M - 1); % Equivalent to value % M

    % Encode the quotient using unary coding
    unary_quotient = repmat('1', 1, quotient);
    unary_quotient = [unary_quotient '0'];

    % Encode the remainder using binary coding
    binary_remainder = dec2bin(remainder, K);

    % Concatenate the unary and binary representations
    compressed_output = [unary_quotient binary_remainder];
end
value = 18; % Input value to encode
K = 2;      % Parameter K
M = 16;     % Parameter M


for value = 0:31
    compressed_output = rice_encode(value, K, M);
    fprintf('Value: %2d, Compressed Output: %s\n', value, compressed_output);
end


%compressed_output = rice_encode(value, K, M);
%disp(['Compressed output: ', compressed_output]);