import Foundation

/// Represents a generic API response structure.
///
/// This struct wraps the result of an API call, including metadata about
/// the success or failure of the call, a status code, an optional message,
/// and the returned data if available.
///
/// - Note: The `data` field is generic and can represent any Codable type.
/// - Example:
/// ```
/// struct UserData: Codable {
///     let id: Int
///     let name: String
/// }
///
/// let response: ApiResponse<UserData> = ...
/// if response.isSuccess {
///     print(response.data?.name ?? "No name")
/// }
/// ```
struct ApiResponse<T: Codable>: Codable {
    /// Indicates whether the API call was successful.
    let isSuccess: Bool

    /// The status code of the API call result.
    let code: String

    /// A message providing additional context or information (e.g., "User registration required").
    let message: String

    /// The returned data, if available.
    ///
    /// - Note: This will be `nil` if the API call does not return any data.
    let data: T?
}
