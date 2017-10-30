/// Possible relations between items in a group
public enum Relation {
    case and, or
}

extension QueryBuilder {
    /// Subset `in` filter.
    @discardableResult
    public func filter(_ field: String, in values: [Encodable?]) throws -> Self {
        let method = FilterMethod.subset(field, .in, values)
        let filter = Filter(entity: M.entity, method: method)
        return addFilter(filter)
    }

    /// Subset `notIn` filter.
    @discardableResult
    public func filter(_ field: String, notIn values: [Encodable?]) throws -> Self {
        let method = FilterMethod.subset(field, .notIn, values)
        let filter = Filter(entity: M.entity, method: method)
        return addFilter(filter)
    }
}
